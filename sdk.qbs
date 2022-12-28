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
    references: [
        'pico_base/pico_base.qbs',
        'pico_platform/pico_platform.qbs',
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
        'hardware_gpio/hardware_gpio.qbs',
        'hardware_base/hardware_base.qbs',
        'hardware_irq/hardware_irq.qbs',
        'hardware_claim/hardware_claim.qbs',
        'hardware_sync/hardware_sync.qbs',
        'hardware_timer/hardware_timer.qbs',
        'hardware_clocks/hardware_clocks.qbs',
        'hardware_watchdog/hardware_watchdog.qbs',
        'hardware_xosc/hardware_xosc.qbs',
        'hardware_resets/hardware_resets.qbs',
        'hardware_pll/hardware_pll.qbs',
        'hardware_divider/hardware_divider.qbs'
    ]
}