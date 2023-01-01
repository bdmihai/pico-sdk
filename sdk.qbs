/*_____________________________________________________________________________
 │                                                                            |
 │ COPYRIGHT (C) 2022 Mihai Baneu                                             |
 │                                                                            |
 | Permission is hereby  granted,  free of charge,  to any person obtaining a |
 | copy of this software and associated documentation files (the "Software"), |
 | to deal in the Software without restriction,  including without limitation |
 | the rights to  use, copy, modify, merge, publish, distribute,  sublicense, |
 | and/or sell copies  of  the Software, and to permit  persons to  whom  the |
 | Software is furnished to do so, subject to the following conditions:       |
 |                                                                            |
 | The above  copyright notice  and this permission notice  shall be included |
 | in all copies or substantial portions of the Software.                     |
 |                                                                            |
 | THE SOFTWARE IS PROVIDED  "AS IS",  WITHOUT WARRANTY OF ANY KIND,  EXPRESS |
 | OR   IMPLIED,   INCLUDING   BUT   NOT   LIMITED   TO   THE  WARRANTIES  OF |
 | MERCHANTABILITY,  FITNESS FOR  A  PARTICULAR  PURPOSE AND NONINFRINGEMENT. |
 | IN NO  EVENT SHALL  THE AUTHORS  OR  COPYRIGHT  HOLDERS  BE LIABLE FOR ANY |
 | CLAIM, DAMAGES OR OTHER LIABILITY,  WHETHER IN AN ACTION OF CONTRACT, TORT |
 | OR OTHERWISE, ARISING FROM,  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR  |
 | THE USE OR OTHER DEALINGS IN THE SOFTWARE.                                 |
 |____________________________________________________________________________|
 |                                                                            |
 |  Author: Mihai Baneu                           Last modified: 16.Dec.2022  |
 |                                                                            |
 |___________________________________________________________________________*/

Project {
    id: sdk

    property bool pico_no_flash: false;
    PropertyOptions {
        name: "pico_no_flash"
        description: 'No flash if 1'
    }

    property bool pico_on_device: true;
    PropertyOptions {
        name: "pico_on_device"
        description: 'Whether the build is targeting an RP2040 device'
    }

    property bool pico_use_malloc_mutex: true;
    PropertyOptions {
        name: "pico_use_malloc_mutex"
        description: 'Whether to protect malloc etc with a mutex, type=bool, default=1 with pico_multicore, 0 otherwise, group=pico_malloc'
    }

    property bool pico_mem_in_ram: false;
    property bool pico_int64_ops_in_ram: false;
    property bool pico_float_in_ram: false;
    property bool pico_float_propagate_nans: false;
    property bool pico_double_in_ram: false;
    property bool pico_double_propagate_nans: false;
    property bool pico_divider_disable_interrupts: false;
    property bool pico_divider_in_ram: false;
    property bool pico_divider_call_idiv0: true;
    property bool pico_divider_call_ldiv0: true;
    property bool pico_bits_in_ram: false;

    property bool pico_stdout_mutex: true;
    PropertyOptions {
        name: "pico_stdout_mutex"
        description: 'Enable/disable mutex around stdout, type=bool, default=1, group=pico_stdio'
    }

    /* global sdk configuration options */
    property stringList sdkDefines : {
        var defines = [
            'LIB_PICO_STDIO_UART=1'
        ];
        
        if (pico_on_device) {
            defines.push('PICO_ON_DEVICE=1');
        }

        if (pico_no_flash) {
            defines.push('PICO_NO_FLASH=1');
        }

        if (pico_divider_disable_interrupts){
            defines.push('PICO_DIVIDER_DISABLE_INTERRUPTS=1');
        }

        return defines;
    }

    references: [
        'pico_bootrom/pico_bootrom.qbs',
        'pico_sync/pico_sync.qbs',
        'pico_time/pico_time.qbs',
        'pico_util/pico_util.qbs',
        'pico_runtime/pico_runtime.qbs',
        'pico_malloc/pico_malloc.qbs',
        'pico_mem_ops/pico_mem_ops.qbs',
        'pico_printf/pico_printf.qbs',
        'pico_bit_ops/pico_bit_ops.qbs',
        'pico_int64_ops/pico_int64_ops.qbs',
        'pico_divider/pico_divider.qbs',
        'pico_float/pico_float.qbs',
        'pico_double/pico_double.qbs',
        'pico_unique_id/pico_unique_id.qbs',
        'pico_binary_info/pico_binary_info.qbs',
        'pico_bootsel_via_double_reset/pico_bootsel_via_double_reset.qbs',
        'pico_stdlib/pico_stdlib.qbs',
        'pico_stdio/pico_stdio.qbs',
        'pico_stdio_semihosting/pico_stdio_semihosting.qbs',
        'pico_stdio_uart/pico_stdio_uart.qbs',
        'pico_stdio_usb/pico_stdio_usb.qbs',
        'pico_usb/pico_usb.qbs',
        'hardware_gpio/hardware_gpio.qbs',
        'hardware_irq/hardware_irq.qbs',
        'hardware_claim/hardware_claim.qbs',
        'hardware_sync/hardware_sync.qbs',
        'hardware_timer/hardware_timer.qbs',
        'hardware_clocks/hardware_clocks.qbs',
        'hardware_watchdog/hardware_watchdog.qbs',
        'hardware_xosc/hardware_xosc.qbs',
        'hardware_resets/hardware_resets.qbs',
        'hardware_pll/hardware_pll.qbs',
        'hardware_divider/hardware_divider.qbs',
        'hardware_flash/hardware_flash.qbs',
        'hardware_uart/hardware_uart.qbs'
    ]
}