//
//  uptoken.c
//  qn
//
//  Created by familymrfan on 16/12/29.
//  Copyright © 2016年 niuniu. All rights reserved.
//

#include "uptoken.h"

char* upLoadToken(const char* bucket, const char* ak, const char* sk)
{
    Qiniu_RS_PutPolicy putPolicy;
    Qiniu_Zero(putPolicy);
    putPolicy.scope = bucket;
    Qiniu_Mac mac;
    mac.accessKey = ak;
    mac.secretKey = sk;
    return Qiniu_RS_PutPolicy_Token(&putPolicy, &mac);
}
