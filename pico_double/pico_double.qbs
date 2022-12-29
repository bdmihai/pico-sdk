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
    name: 'pico_double'

    rp.includePaths: [ 
        'include',
        '../pico_base/include',
        '../pico_platform/include',
        '../pico_bootrom/include',
        '../hardware_base/include',
        '../hardware_divider/include'
    ]

    rp.defines: {
        var defines = sdkDefines;
        if (pico_double_in_ram) {
            defines.push('PICO_DOUBLE_IN_RAM=1');
        }
        if (pico_double_propagate_nans) {
            defines.push('PICO_DOUBLE_PROPAGATE_NANS=1');
        }
        return defines;
    }

    files: [
        'include/**/*.h',
        '*.c',
        '*.S'
    ]

    excludeFiles: [
        'double_none.S'
    ]

    Export {
        rp.linkerFlags: [
            '-Wl,--undefined=__wrap___aeabi_dadd',
            '-Wl,--wrap=__aeabi_dadd',
            '-Wl,--wrap=__aeabi_ddiv',
            '-Wl,--wrap=__aeabi_dmul',
            '-Wl,--wrap=__aeabi_drsub',
            '-Wl,--wrap=__aeabi_dsub',
            '-Wl,--wrap=__aeabi_cdcmpeq',
            '-Wl,--wrap=__aeabi_cdrcmple',
            '-Wl,--wrap=__aeabi_cdcmple',
            '-Wl,--wrap=__aeabi_dcmpeq',
            '-Wl,--wrap=__aeabi_dcmplt',
            '-Wl,--wrap=__aeabi_dcmple',
            '-Wl,--wrap=__aeabi_dcmpge',
            '-Wl,--wrap=__aeabi_dcmpgt',
            '-Wl,--wrap=__aeabi_dcmpun',
            '-Wl,--wrap=__aeabi_i2d',
            '-Wl,--wrap=__aeabi_l2d',
            '-Wl,--wrap=__aeabi_ui2d',
            '-Wl,--wrap=__aeabi_ul2d',
            '-Wl,--wrap=__aeabi_d2iz',
            '-Wl,--wrap=__aeabi_d2lz',
            '-Wl,--wrap=__aeabi_d2uiz',
            '-Wl,--wrap=__aeabi_d2ulz',
            '-Wl,--wrap=__aeabi_d2f',
            '-Wl,--wrap=sqrt',
            '-Wl,--wrap=cos',
            '-Wl,--wrap=sin',
            '-Wl,--wrap=tan',
            '-Wl,--wrap=atan2',
            '-Wl,--wrap=exp',
            '-Wl,--wrap=log',
            '-Wl,--wrap=ldexp',
            '-Wl,--wrap=copysign',
            '-Wl,--wrap=trunc',
            '-Wl,--wrap=floor',
            '-Wl,--wrap=ceil',
            '-Wl,--wrap=round',
            '-Wl,--wrap=sincos',
            '-Wl,--wrap=asin',
            '-Wl,--wrap=acos',
            '-Wl,--wrap=atan',
            '-Wl,--wrap=sinh',
            '-Wl,--wrap=cosh',
            '-Wl,--wrap=tanh',
            '-Wl,--wrap=asinh',
            '-Wl,--wrap=acosh',
            '-Wl,--wrap=atanh',
            '-Wl,--wrap=exp2',
            '-Wl,--wrap=log2',
            '-Wl,--wrap=exp10',
            '-Wl,--wrap=log10',
            '-Wl,--wrap=pow',
            '-Wl,--wrap=powint',
            '-Wl,--wrap=hypot',
            '-Wl,--wrap=cbrt',
            '-Wl,--wrap=fmod',
            '-Wl,--wrap=drem',
            '-Wl,--wrap=remainder',
            '-Wl,--wrap=remquo',
            '-Wl,--wrap=expm1',
            '-Wl,--wrap=log1p',
            '-Wl,--wrap=fma'
        ]
    }
}
