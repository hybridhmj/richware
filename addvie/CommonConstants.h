//
//  CommonConstants.h
//  DukkubiSesang
//
//  Created by Sejin Jang on 2015. 4. 27..
//
//

#ifndef DukkubiSesang_CommonConstants_h
#define DukkubiSesang_CommonConstants_h
#define Log @"LOG"



// Common
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define RGB(r, g, b)        [UIColor colorWithRed:  r/255.00 green:  g/255.00 blue: b/255.00 alpha:  1]
#define Trim(stringValue) [stringValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]

// AppDelegate
#define appDelegate ((AppDelegate *)[[UIApplication sharedApplication] delegate])

// NETWORK

#define TIMEOUT_API 10

// TEST
//#define URL_UPLOAD_IMAGE(imgSize, imgPath) [NSURL URLWithString:[NSString stringWithFormat:@"http://182.161.118.74:8002/uploadImg/%@/%@", imgSize, imgPath]];
//#define URL_UPLOAD_FILE(filePath) [NSURL URLWithString:[NSString stringWithFormat:@"http://182.161.118.74:8002/uploadFile/%@", filePath]];

// REAL
#define URL_UPLOAD_IMAGE(imgSize, imgPath) [NSURL URLWithString:[NSString stringWithFormat:@"http://211.55.39.18/uploadImg/%@/%@", imgSize, imgPath]];
#define URL_UPLOAD_FILE(filePath) [NSURL URLWithString:[NSString stringWithFormat:@"http://211.55.39.18/uploadFile/%@", filePath]];

//#define WEB_URL(url) [NSString stringWithFormat:@"%@%@", URL_BASE, url]

// 디바이스 타입 1: 안드로이드, 2: 아이폰
#define DEVICE_TYPE 2

// 푸시키 키
#define APNS_TOKEN @"pushKey"

// 디바이스 아이디
#define c_appIdentifier [OpenUDID value]

// 로그인 타입
#define LOGIN_FACEBOOK 2

// 성별
#define GENDER_MALE 1
#define GENDER_FEMALE 2


// ALERT TAG
#define ALERT_VALID_ID                  100
#define ALERT_VALID_NICKNAME            101
#define ALERT_VALID_PW                  102
#define ALERT_VALID_CONFIRM_PW          103
#define ALERT_VALID_EMAIL               104
#define ALERT_VALID_CHK_AGREE           105
#define ALERT_VALID_CHK_PRIVACY         106
#define ALERT_VALID_CHK_OTHERPRIVACY    107
#define ALERT_VALID_NEWPW               108
#define ALERT_VALID_NEW_CONFIRM_PW      109
#define ALERT_VALID_TITLE               110
#define ALERT_VALID_CONTENTS            111
#define ALERT_VALID_COMPANYNAME         112
#define ALERT_VALID_COMPANYADDRESS      113
#define ALERT_VALID_COMPANYTELNUM       114
#define ALERT_VALID_WEBURL              115
#define ALERT_VALID_ONELINEINTRO        116
#define ALERT_VALID_COMPANYINTRO        117


// 약관유형
#define AGREE            1
#define PRIVACY          2
#define OTHERPRIVACY     3
#define POSITIONAGREE    4
#define COMPANYINTRO     5



// 버그게시판타입
#define ARR_BUGTYPE  @[\
@{KEY_NAME : @"19", KEY_VALUE : @"프로그램 오류"}, \
@{KEY_NAME : @"20", KEY_VALUE : @"디자인 오류"}, \
@{KEY_NAME : @"21", KEY_VALUE : @"회원관리"}, \
@{KEY_NAME : @"22", KEY_VALUE : @"기타"}]


// 하단 탭바관련
#define TABBAR_VIEW 1000
#define TABBAR_BUTTON_HOME 1001
#define TABBAR_BUTTON_TOUR 1002
#define TABBAR_BUTTON_MAKECOURSE 1003
#define TABBAR_BUTTON_MYPAGE 1004
#define TABBAR_BUTTON_MORE 1005

// 기본설정 위치
#define DEFAULT_LATITUDE [NSNumber numberWithInteger:37.566565]
#define DEFAULT_LONGITUDE [NSNumber numberWithInteger:126.977955]


#endif
