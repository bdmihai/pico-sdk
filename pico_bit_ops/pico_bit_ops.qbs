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
 |  Author: Mihai Baneu                           Last modified: 28.Dec.2022  |
 |                                                                            |
 |___________________________________________________________________________*/

import '../sdk-product.qbs' as SdkProduct

SdkProduct {
    name: 'pico_bit_ops'

    rp.includePaths: [ 
        '../pico_base/include',
        '../pico_platform/include',
        '../pico_bootrom/include',
    ]

    rp.defines: {
        var defines = sdkDefines;
        if (pico_bits_in_ram) {
            defines.push('PICO_BITS_IN_RAM=1');
        }
        return defines;
    }

    files: [
        '*.S'
    ]

    Export {
        rp.linkerFlags: [ 
            '-Wl,--undefined=__wrap___clzsi2',
            '-Wl,--wrap=__clzsi2',
            '-Wl,--wrap=__clzdi2',
            '-Wl,--wrap=__ctzsi2',
            '-Wl,--wrap=__ctzdi2',
            '-Wl,--wrap=__popcountsi2',
            '-Wl,--wrap=__popcountdi2',
            '-Wl,--wrap=__clz',
            '-Wl,--wrap=__clzl',
            '-Wl,--wrap=__clzll'
        ]
    }
}
