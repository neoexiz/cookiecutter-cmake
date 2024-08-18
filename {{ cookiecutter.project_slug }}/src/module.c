#include <stdio.h>

#include "event2/event.h"

#include "module.h"

void module_init(void) {
    struct event_base *base = event_base_new();

    printf("Hello Module!");

    event_base_dispatch(base);
    event_base_free(base);
}
