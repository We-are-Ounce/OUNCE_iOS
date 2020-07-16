//
//  APIConstants.swift
//  Ounce
//
//  Created by Junhyeon on 2020/07/01.
//  Copyright © 2020 박주연. All rights reserved.
//

struct APIConstants {
    
    static let BaseURL = "http://52.79.90.119:3000/"
    
    // POST 회원가입
    static let signUp = BaseURL + "user/signup"
    // POST
    static let signIn = BaseURL + "user/signin"
    // POST
    static let checkID = BaseURL + "user/checkId"
    // POST
    static let email = "https://ounce.herokuapp.com/emailto"
    
    // POST 고양이 프로필 등록
    static let registerProfile = BaseURL + "profile/register"
    // GET 프로필 조회 /profile/mainProfile/:profileIdx
    static let catInfo = BaseURL + "profile/mainProfile/"
    // GET 팔로워 목록 /profile/followerList/:profileIdx
    static let followerList = BaseURL + "profile/followerList"
    // GET 팔로잉 목록 /profile/followingList/:profileIdx
    static let followingList = BaseURL + "profile/followingList"
    // DELETE 팔로우 취소 profile/deleteFollow
    static let deleteFollow = BaseURL + "profile/deleteFollow"
    // PUT 프로필 수정 /profile/edit/:profileIdx
    static let editProfile = BaseURL + "profile/edit/"
    // GET 프로필 전환 /profile/convesion/:profileIdx
    static let changeProfile = BaseURL + "profile/convesion"
    // POST 프로필 추가할때 프로필 갯수 체크 /profile/addProfile
    static let certificationAddProfile = BaseURL + "profile/addProfile"
    // GET 다른 고양이 프로필 조회 /profile/:profileIdx
    static let otherProfile = BaseURL + "profile/"
    
    // POST 유저검색 /search/user
    static let searchUser = BaseURL + "search/user"
    // POST 기록용 검색 /search/toWrite/:profileIdx
    static let searchToWrite = BaseURL + "search/toWrite"
    // POST 제품, 제조사명 검색 /search/food
    static let searchProduct = BaseURL + "search/food"
    // POST 제품 리뷰전체보기 /search/reviewAll
    static let reviewAll = BaseURL + "search/reviewAll"
    // POST 검색 후 평균 총점 정렬 /search/reviewAll/avgRating
    static let reviewAllavgRating = BaseURL + "search/reviewAll/avgRating"
    // POST 검색 후 평균 기호성 정렬 /search/reviewAll/avgPrefer
    static let reviewAllavgPrefer = BaseURL + "search/reviewAll/avgPrefer"
    
    // POST 리뷰등록 /review/add
    static let addReview = BaseURL + "review/add"
    // PUT 내가 쓴 리뷰 수정 /review/update/:reviewIdx
    static let updateReview = BaseURL + "review/update"
    // DELETE 내가 쓴 리뷰 삭제 /review/delete/:profileIdx/:reviewIdx
    static let deleteReview = BaseURL + "review/delete"
    // GET 내 계정 캣푸드 리뷰 목록 /review/:profileIdx
    static let myReview = BaseURL + "review/"
    // GET 다른고양이 캣푸드 리뷰 목록 /profile/review/:profileIdx
    static let otherReview = BaseURL + "review/"
    // GET 캣푸드 목록 총점 정렬 /review/:profileIdx/rating
    static let reviewRating = BaseURL + "review/"
    // GET 캣푸드 목록 기호도 정렬 /review/:profileIdx/prefer
    static let reviewPrefer = BaseURL + "review/"
    // GET 캣푸드 목록 시간 정렬 /review/:profileIdx/date
    static let reviewDate = BaseURL + "review/"
    // GET 캣푸드 목록 제조사 필터링 /review/:profileIdx/category
    static let reviewCategory = BaseURL + "review/"
    // GET 캣푸드 목록 선택 필터링 /review/:profileIdx/filter
    static let reviewFilter = BaseURL + "review/"
    // GET 캣푸드 리뷰 상세보기 /review/detail/
    static let reviewDetail = BaseURL + "review/detail/"
    
    // GET 추천 고양이 리스트
    static let recommend = BaseURL + "search/recommend"
    // GET 유사도 제공
    static let similarity = BaseURL + "search/similarity"
}
