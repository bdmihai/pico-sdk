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
    name: 'pico_float'

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
        if (pico_float_in_ram) {
            defines.push('PICO_FLOAT_IN_RAM=1');
        }
        if (pico_float_propagate_nans) {
            defines.push('PICO_FLOAT_PROPAGATE_NANS=1');
        }
        return defines;
    }

    files: [
        'include/**/*.h',
        '*.c',
        '*.S'
    ]

    excludeFiles: [
        'float_none.S'
    ]

    Export {
        rp.linkerFlags: [
            '-Wl,--undefined=__wrap___aeabi_fadd',
            '-Wl,--wrap=__aeabi_fadd',
            '-Wl,--wrap=__aeabi_fdiv',
            '-Wl,--wrap=__aeabi_fmul',
            '-Wl,--wrap=__aeabi_frsub',
            '-Wl,--wrap=__aeabi_fsub',
            '-Wl,--wrap=__aeabi_cfcmpeq',
            '-Wl,--wrap=__aeabi_cfrcmple',
            '-Wl,--wrap=__aeabi_cfcmple',
            '-Wl,--wrap=__aeabi_fcmpeq',
            '-Wl,--wrap=__aeabi_fcmplt',
            '-Wl,--wrap=__aeabi_fcmple',
            '-Wl,--wrap=__aeabi_fcmpge',
            '-Wl,--wrap=__aeabi_fcmpgt',
            '-Wl,--wrap=__aeabi_fcmpun',
            '-Wl,--wrap=__aeabi_i2f',
            '-Wl,--wrap=__aeabi_l2f',
            '-Wl,--wrap=__aeabi_ui2f',
            '-Wl,--wrap=__aeabi_ul2f',
            '-Wl,--wrap=__aeabi_f2iz',
            '-Wl,--wrap=__aeabi_f2lz',
            '-Wl,--wrap=__aeabi_f2uiz',
            '-Wl,--wrap=__aeabi_f2ulz',
            '-Wl,--wrap=__aeabi_f2d',
            '-Wl,--wrap=sqrtf',
            '-Wl,--wrap=cosf',
            '-Wl,--wrap=sinf',
            '-Wl,--wrap=tanf',
            '-Wl,--wrap=atan2f',
            '-Wl,--wrap=expf',
            '-Wl,--wrap=logf',
            '-Wl,--wrap=ldexpf',
            '-Wl,--wrap=copysignf',
            '-Wl,--wrap=truncf',
            '-Wl,--wrap=floorf',
            '-Wl,--wrap=ceilf',
            '-Wl,--wrap=roundf',
            '-Wl,--wrap=sincosf',
            '-Wl,--wrap=asinf',
            '-Wl,--wrap=acosf',
            '-Wl,--wrap=atanf',
            '-Wl,--wrap=sinhf',
            '-Wl,--wrap=coshf',
            '-Wl,--wrap=tanhf',
            '-Wl,--wrap=asinhf',
            '-Wl,--wrap=acoshf',
            '-Wl,--wrap=atanhf',
            '-Wl,--wrap=exp2f',
            '-Wl,--wrap=log2f',
            '-Wl,--wrap=exp10f',
            '-Wl,--wrap=log10f',
            '-Wl,--wrap=powf',
            '-Wl,--wrap=powintf',
            '-Wl,--wrap=hypotf',
            '-Wl,--wrap=cbrtf',
            '-Wl,--wrap=fmodf',
            '-Wl,--wrap=dremf',
            '-Wl,--wrap=remainderf',
            '-Wl,--wrap=remquof',
            '-Wl,--wrap=expm1f',
            '-Wl,--wrap=log1pf',
            '-Wl,--wrap=fmaf',
        ]
    }
}
