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
    name: 'pico_mem_ops'

    rp.includePaths: [ 
        'include',
        '../pico_util/include',
        '../pico_bootrom/include'
    ]

    rp.defines: {
        var defines = sdkDefines;
        if (pico_mem_in_ram) {
            defines.push('PICO_MEM_IN_RAM=1');
        }
        return defines;
    }

    files: [
        'include/**/*.h',
        '*.c',
        '*.S'
    ]

    Export {
        rp.linkerFlags: [ 
            '-Wl,--wrap=memcpy', 
            '-Wl,--wrap=memset', 
            '-Wl,--wrap=__aeabi_memcpy', 
            '-Wl,--wrap=__aeabi_memset', 
            '-Wl,--wrap=__aeabi_memcpy4', 
            '-Wl,--wrap=__aeabi_memset4', 
            '-Wl,--wrap=__aeabi_memcpy8', 
            '-Wl,--wrap=__aeabi_memset8' 
        ]
    }
}
