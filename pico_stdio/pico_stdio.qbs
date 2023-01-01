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

import '../sdk-product.qbs' as SdkProduct

SdkProduct {
    name: 'pico_stdio'

    rp.includePaths: [ 
        'include',
        '../pico_util/include',
        '../pico_sync/include',
        '../pico_time/include',
        '../pico_printf/include',
        '../pico_stdio_semihosting/include',
        '../pico_stdio_uart/include',
        '../pico_stdio_usb/include',
        '../hardware_sync/include',
        '../hardware_timer/include',
        '../hardware_irq/include',
        '../hardware_uart/include'
    ]

    rp.defines: {
        var defines = sdkDefines;
        if (!pico_stdout_mutex) {
            defines.push('PICO_STDOUT_MUTEX=0');
        }
        return defines;
    }

    files: [
        'include/**/*.h',
        '*.c'
    ]

    Export {
        rp.linkerFlags: [ 
            '-Wl,--wrap=printf',
            '-Wl,--wrap=vprintf',
            '-Wl,--wrap=puts',
            '-Wl,--wrap=putchar',
            '-Wl,--wrap=getchar'
        ]
    }
}
