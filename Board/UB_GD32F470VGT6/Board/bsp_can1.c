#include <bsp_can1.h>
#include <os_kernel.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define CANx_CLOCK      RCU_CAN1
#define CANx            CAN1

#define CANx_Tx_CLOCK   RCU_GPIOB
#define CANx_Tx_GPIO    GPIOB
#define CANx_Tx_PIN     GPIO_PIN_13
#define CANx_Tx_AF      GPIO_AF_9

#define CANx_Rx_CLOCK   RCU_GPIOB
#define CANx_Rx_GPIO    GPIOB
#define CANx_Rx_PIN     GPIO_PIN_12
#define CANx_Rx_AF      GPIO_AF_9

#define CANx_Rx_IRQn        CAN1_RX0_IRQn
#define CANx_Rx_IRQHandler  CAN1_RX0_IRQHandler
#define CANx_FIFOn          CAN_FIFO0
#define CANx_INT_TYPE       CAN_INT_RFNE0
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static BSP_CAN1_RxHandler BSP_CAN1__RxHandler=0;
static void* BSP_CAN1__RxHandlerUserdata=0;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static void can_gpio_config(void)
{
    /* enable CAN clock */
    rcu_periph_clock_enable(CANx_CLOCK);
    rcu_periph_clock_enable(CANx_Tx_CLOCK);
    rcu_periph_clock_enable(CANx_Rx_CLOCK);
    
    /* configure CAN0 GPIO */
    gpio_output_options_set(CANx_Tx_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, CANx_Tx_PIN);
    gpio_mode_set(CANx_Tx_GPIO, GPIO_MODE_AF, GPIO_PUPD_NONE, CANx_Tx_PIN);
    gpio_af_set(CANx_Tx_GPIO, CANx_Tx_AF, CANx_Tx_PIN);
    
    gpio_output_options_set(CANx_Rx_GPIO, GPIO_OTYPE_PP, GPIO_OSPEED_50MHZ, CANx_Rx_PIN);
    gpio_mode_set(CANx_Rx_GPIO, GPIO_MODE_AF, GPIO_PUPD_NONE, CANx_Rx_PIN);
    gpio_af_set(CANx_Rx_GPIO, CANx_Rx_AF, CANx_Rx_PIN);
}

static void nvic_config(void)
{
    nvic_irq_enable(CANx_Rx_IRQn,0,0);
}

static void can_config(uint32_t BaudRate)
{
    can_parameter_struct            can_parameter;
    can_filter_parameter_struct     can_filter;

    can_struct_para_init(CAN_INIT_STRUCT, &can_parameter);
    can_struct_para_init(CAN_FILTER_STRUCT, &can_filter);

    /* initialize CAN register */
    can_deinit(CANx);
    
    /* initialize CAN parameters */
    can_parameter.time_triggered = DISABLE;
    can_parameter.auto_bus_off_recovery = ENABLE;
    can_parameter.auto_wake_up = DISABLE;
    can_parameter.auto_retrans = ENABLE;
    can_parameter.rec_fifo_overwrite = DISABLE;
    can_parameter.trans_fifo_order = DISABLE;
    can_parameter.working_mode = CAN_NORMAL_MODE;
    can_parameter.resync_jump_width = CAN_BT_SJW_1TQ;
    can_parameter.time_segment_1 = CAN_BT_BS1_7TQ;
    can_parameter.time_segment_2 = CAN_BT_BS2_2TQ;
    
    switch(BaudRate){
        case CAN_BAUDRATE_1M: {
            can_parameter.prescaler = 6;
            break;
        }
        case CAN_BAUDRATE_500K: {
            can_parameter.prescaler = 12;
            break;
        }
        case CAN_BAUDRATE_250K: {
            can_parameter.prescaler = 24;
            break;
        }
        case CAN_BAUDRATE_125K: {
            can_parameter.prescaler = 48;
            break;
        }
        case CAN_BAUDRATE_100K: {
            can_parameter.prescaler = 60;
            break;
        }
        case CAN_BAUDRATE_50K: {
            can_parameter.prescaler = 120;
            break;
        }
        default:
            can_parameter.prescaler = 24;
            break;
    }
    

    /* initialize CAN */
    can_init(CANx, &can_parameter);
    
    /* initialize filter */ 
    can_filter.filter_number=0;
    can_filter.filter_mode = CAN_FILTERMODE_MASK;
    can_filter.filter_bits = CAN_FILTERBITS_32BIT;
    can_filter.filter_list_high = 0x0000;
    can_filter.filter_list_low = 0x0000;
    can_filter.filter_mask_high = 0x0000;
    can_filter.filter_mask_low = 0x0000;
    can_filter.filter_fifo_number = CANx_FIFOn;
    can_filter.filter_enable = ENABLE;
    
    can_filter_init(&can_filter);
        
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
void BSP_CAN1_Init(uint32_t BaudRate)
{
    can_gpio_config();
    nvic_config();
    can_config(BaudRate);
    can_interrupt_enable(CANx, CANx_INT_TYPE);
}

void BSP_CAN1_SetRxHandler(BSP_CAN1_RxHandler rxHandler, void* userdata)
{
    BSP_CAN1__RxHandler = rxHandler;
    BSP_CAN1__RxHandlerUserdata = userdata;
}

int BSP_CAN1_Send(can_trasnmit_message_struct* txMsg){
    uint8_t transmit_mailbox = can_message_transmit(CANx, txMsg);
    /* waiting for transmit completed */
    uint32_t timeout = 0xFFFF;
    while((CAN_TRANSMIT_OK != can_transmit_states(CANx, transmit_mailbox)) && (0 != timeout)){
        timeout--;
    }
    if(timeout==0){
        return CAN_ETIMEOUT;
    }
    
    return CAN_EOK;
}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

void CANx_Rx_IRQHandler(void)
{
    can_receive_message_struct rx_message;
    os_interrupt_enter();
    can_message_receive(CANx, CANx_FIFOn, &rx_message);
    if(BSP_CAN1__RxHandler){
        BSP_CAN1__RxHandler(&rx_message, BSP_CAN1__RxHandlerUserdata);
    }
    os_interrupt_exit();
}

