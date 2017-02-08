####2017.02.08 - #20 (5주차 3번째 수업)

#자료구조

##포인터 pointer
###Memory구조

###Pointer

##Value & Reference

###구조체 struct

###typedef 별명 짓기
```objc
typedef <데이터타입> <이름>;
```

###구조체 vs 클래스



##배열 array  
###Array  

###Linked List   

###NSArray  

###NSMutableArray  


###Dictionary


##영화 json 데이터 구조 만들어보기
```objc
// 서버로부터 데이터를 앱이 받는 상황이라 가정

{ "영화id" : int,
  "제목"   : {"국문" : str,
             "영문" :str },
  "개요"   : { "장르"     : [str, str, ...],
              "제작국가"  : [str, ...],
              "플레이타임" : int,
              "국내개봉일" : str,
              "국내등급"  : int }, 
  "줄거리" : str,
  "참여" : { "감독"   : [str, str, ...],
            "출연진" : { "주연" : [str, str, ...],
                       "조연" : [str, str, ...] },
            "제작사" : str,
            "배급사" : str },
  "미디어" : {"포스터" : [str, str, ...],
            "스틸컷" : [str, str, ...],
            "영상"   : [str, str, ...] },
  "평가"   : {"전체평점" : {"평론가평점" : float,
                         "평론평가수 : int, 
                         "관객평점"   : float,
                         "관객평가수" : int },
             "평론가"  : [{"사용자id" : int, "평점" : float, "리뷰" : str }, 
                        {"사용자id" : int, "평점" : float, "리뷰" : str },
                        ...],
             "관객"   : [{"사용자id" : int, "평점" : float, "리뷰" : str }, 
                        {"사용자id" : int, "평점" : float, "리뷰" : str },
                        ...]
}
```

##과제
###literal문법 알아보기

###json 알아보기
