#!/bin/sh
# Source: http://stackoverflow.com/questions/20135054/ssh-connecttimeout-option
parallel --gnu --bg --jobs 50 \
ssh -o BatchMode=yes \
    -o StrictHostKeyChecking=no \
    -o ConnectTimeout=10 \
    -l ${USERNAME} \
    {} \
    "${COMMAND} -i {} || echo timeout" \
::: ${IP}
