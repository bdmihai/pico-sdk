/*
 * Copyright (c) 2020 Raspberry Pi (Trading) Ltd.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef _PICO_UTIL_DATETIME_H
#define _PICO_UTIL_DATETIME_H

#include "pico.h"

#ifdef __cplusplus
extern "C" {
#endif

/** \file datetime.h
 * \defgroup util_datetime datetime
 * \brief Date/Time formatting
 * \ingroup pico_util
 */

/*! \brief  Convert a datetime_t structure to a string
 *  \ingroup util_datetime
 *
 * \param buf character buffer to accept generated string
 * \param buf_size The size of the passed in buffer
 * \param t The datetime to be converted.
 */
void datetime_to_str(char *buf, uint buf_size, const datetime_t *t);

/*! fn to_us_since_boot
 * \brief convert an absolute_time_t into a number of microseconds since boot.
 * \param t the absolute time to convert
 * \return a number of microseconds since boot, equivalent to t
 * \ingroup timestamp
 */
static inline uint64_t to_us_since_boot(absolute_time_t t) {
#ifdef NDEBUG
    return t;
#else
    return t._private_us_since_boot;
#endif
}

/*! fn update_us_since_boot
 * \brief update an absolute_time_t value to represent a given number of microseconds since boot
 * \param t the absolute time value to update
 * \param us_since_boot the number of microseconds since boot to represent. Note this should be representable
 *                      as a signed 64 bit integer
 * \ingroup timestamp
 */
static inline void update_us_since_boot(absolute_time_t *t, uint64_t us_since_boot) {
#ifdef NDEBUG
    *t = us_since_boot;
#else
    assert(us_since_boot <= INT64_MAX);
    t->_private_us_since_boot = us_since_boot;
#endif
}

/*! fn from_us_since_boot
 * \brief convert a number of microseconds since boot to an absolute_time_t
 * \param us_since_boot number of microseconds since boot
 * \return an absolute time equivalent to us_since_boot
 * \ingroup timestamp
 */
static inline absolute_time_t from_us_since_boot(uint64_t us_since_boot) {
    absolute_time_t t;
    update_us_since_boot(&t, us_since_boot);
    return t;
}

#ifdef __cplusplus
}
#endif
#endif
