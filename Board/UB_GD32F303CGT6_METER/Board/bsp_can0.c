#include <bsp_can0.h>
#include <os_kernel.h>

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#define CANx_CLOCK          RCU_CAN0
#define CANx                CAN0

#define CANx_Tx_CLOCK       RCU_GPIOA
#define CANx_Tx_GPIO        GPIOA
#define CANx_Tx_PIN         GPIO_PIN_12

#define CANx_Rx_CLOCK       RCU_GPIOA
#define CANx_Rx_GPIO        GPIOA
#define CANx_Rx_PIN         GPIO_PIN_11

#define CANx_REMAP          GPIO_CAN0_FULL_REMAP
#define CANx_REMAP_VALUE    ENABLE

#define CANx_Rx_IRQn        USBD_LP_CAN0_RX0_IRQn
#define CANx_Rx_IRQHandler  USBD_LP_CAN0_RX0_IRQHandler
#define CANx_FIFOn          CAN_FIFO0
#define CANx_INT_TYPE       CAN_INT_RFNE0
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static BSP_CAN0_RxHandler BSP_CAN0__RxHandler=0;
static void* BSP_CAN0__RxHandlerUserdata=0;


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static void can_gpio_config(void)
{
    /* enable CAN clock */
    rcu_periph_clock_enable(CANx_CLOCK);
    rcu_periph_clock_enable(CANx_Tx_CLOCK);
    rcu_periph_clock_enable(CANx_Rx_CLOCK);
    rcu_periph_clock_enable(RCU_AF);

    /* configure CAN0 GPIO */
    gpio_init(CANx_Rx_GPIO,GPIO_MODE_IPU,GPIO_OSPEED_50MHZ,CANx_Rx_PIN);
    gpio_init(CANx_Tx_GPIO,GPIO_MODE_AF_PP,GPIO_OSPEED_50MHZ,CANx_Tx_PIN);
//    gpio_pin_remap_config(GPIO_CAN_FULL_REMAP,CANx_REMAP_VALUE);
}

static void nvic_config(void)
{
    nvic_irq_enable(CANx_Rx_IRQn,0,0);
    can_interrupt_enable(CANx, CANx_INT_TYPE);
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
    can_parameter.auto_retrans = DISABLE;
    can_parameter.rec_fifo_overwrite = DISABLE;
    can_parameter.trans_fifo_order = DISABLE;
    can_parameter.working_mode = CAN_NORMAL_MODE;
    can_parameter.resync_jump_width = CAN_BT_SJW_1TQ;
    can_parameter.time_segment_1 = CAN_BT_BS1_8TQ;
    can_parameter.time_segment_2 = CAN_BT_BS2_1TQ;

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

void BSP_CAN0_DeInit(void){
    rcu_periph_clock_disable(CANx_CLOCK);
    rcu_periph_clock_disable(CANx_Tx_CLOCK);
    rcu_periph_clock_disable(CANx_Rx_CLOCK);
    rcu_periph_clock_disable(RCU_AF);
    can_interrupt_disable(CANx, CANx_INT_TYPE);
    nvic_irq_disable(CANx_Rx_IRQn);
    can_deinit(CANx);
}

void BSP_CAN0_Init(uint32_t BaudRate)
{
    can_gpio_config();
    can_config(BaudRate);
    nvic_config();
}

void BSP_CAN0_SetRxHandler(BSP_CAN0_RxHandler rxHandler, void* userdata)
{
    BSP_CAN0__RxHandler = rxHandler;
    BSP_CAN0__RxHandlerUserdata = userdata;
}

int BSP_CAN0_Send(can_trasnmit_message_struct* txMsg){
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
    if(BSP_CAN0__RxHandler){
        BSP_CAN0__RxHandler(&rx_message, BSP_CAN0__RxHandlerUserdata);
    }
    os_interrupt_exit();
}

