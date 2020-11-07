# 💯 AnswerChecker 💯 < Toy Project > 
<hr/>
<h2> 왜 만들었을까 ❓</h2>

AWS certificate 취득을 준비하며 정답지가 없는 문제들을 풀며 답을 비교해 봐야했다.<br />
마침 Spring 을 배우고 있었고, 실습을 해보고 싶었다.<br />
네이버 클라우드 플랫폼에 받아둔 크레딧이 아까워 얼른 사용해야했다. <br />

<h2> 💻 구동 환경 🖥</h2>

Java : 1.8.0_271 <br />
tomcat : 9.0.39 <br />
DB : MySQL 5.7.32 <br />
JDBC : MySQL Connector/J 8.0.22 <br />

  <h2> 👏 Use Case 👏 </h2>
  
  1. 메인 화면 - 소규모 팀원들끼리의 답 체크가 주 목적이었으므로 이름을 통한 로그인으로 구현
  <img src="https://user-images.githubusercontent.com/38396374/97579365-536a5b00-1a35-11eb-995a-ff56686e1e3e.png" />  
  2. 로그인 완료 화면 - 로그인을 하지 않고 다른 페이지 접속 시 홈으로 리다이렉트 된다.
  <img src="https://user-images.githubusercontent.com/38396374/97579418-62e9a400-1a35-11eb-9264-3e136c806e30.png" />
  
  3. 답 모음 화면 - 시작 번호와 끝 번호를 입력함으로써 조회하고 싶은 범위 내 문제들의 팀원들이 입력한 답을 확인할 수 있다.
  <img src="https://user-images.githubusercontent.com/38396374/97581138-8dd4f780-1a37-11eb-96e4-91e22d09eba0.png" />
  <img src="https://user-images.githubusercontent.com/38396374/97579678-b0fea780-1a35-11eb-8efc-88436c155920.png" />
  
  4. 답 등록 화면 - 시작 번호를 입력해 40문제 씩 답을 등록한다, 시작 번호를 입력하면 동적으로 문제 번호들이 바뀐다.
  <img src="https://user-images.githubusercontent.com/38396374/97581315-c379e080-1a37-11eb-8942-713c08fd84aa.png" />
  <img src="https://user-images.githubusercontent.com/38396374/97581345-cd9bdf00-1a37-11eb-864a-416dc9eb132b.png" />
  
  5. 로그아웃 - 세션을 제거하고 홈화면으로 돌아간다.
