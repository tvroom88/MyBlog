MyBlog 프로젝트 :

기획 의도 : 
인턴쉽 지원중 일주일 기한의 과제를 통해 Ruby 와 Ruby on Rails 를 처음 접해봄.
어쩌피 해본거 마무리 정리 및 더 공부할만한 내용을 대충이라도 정리해서 올리면 
나중에 혹시 다시 공부하고 싶거나 해야하는 일이 있을때 도움이 될까봐 시작함.


과제 제출 이후 일주일간 배운 내용 정리 (Blog 내용) + User 부분과 Bootstrap의 적용을 추가
(일이 있어 2일은 아예 못하고 5일동안 7시간 ~ 9시간 계속 인터넷 찾고 적용하고 했다는...)

1. Blog 모델 (Keyword 부분은 있어으나 지우고 나중에 시간 여유가 있다면 tag 부분으로 바꿔서 추가시켜줄 예정)

2. User 모델  : [Gem : devise] 사용
참고 : https://kbs4674.tistory.com/52

3. BootStrap 적용 
참고 :
(1) 공식 홈페이지 : https://getbootstrap.com/
(2) bootstrap 설치 : https://cycorld.gitbooks.io/lean-startup-on-rails/content/5-1-ac8c-c2dc-d310-b9cc-b4e4-ae30/5-2-bootstrap-b514-c790-c778-c801-c6a9.html

4. admin 추가
참고 : https://blog.naver.com/kbs4674/221187526054

------------------------------------------------------------------------------------------------------------------------
MVC : 

1. Model :
   (1) Post : title:string text:content
   (2) User : admin: boolean, email:string, password:string
   (4) Keyword :keyword:string user_ids:string(Serialize 때문에 array저장할때는 String이로 저장 -> 그게 어떤 데이터 타입의 array던지)

2. Controller :
   (1) HomeController : index(main 화면), blog_board(블로그의 main화), blog(blog 저장 form), keyword(keyword 저장 form)
   (2) ApiController : blog글 저장 및 keyword 내용 저장. Keyword 부분은 background에서 수행해서 비동기처럼 구현
   (3) users : Controller가 있지만 devise 사용함.  Custom하게 쓰려면 구현가능 하지만 인터넷좀 찾아봐야할듯...

3. View :
   (1) 홈페이지 메인 뷰
   index.html (http://0.0.0.0:3000/ or http://0.0.0.0:3000/home/index)

   (2) blog 관련 view
   blog_board.html (적은 블로그들 )
   blog.html (블로그 추가)

   (3) user 관련 view :


