# SimpleBlog
Simple Blog webapp with SpringJPA, bootstrap, jQuery, Markdown

가장 간단하게 만든 블로그 소스

### Refference and Used Skills.

블로그를 만들 때 사용 한 것은 아래 와 같다.

1. Server-side
    * SpringFramework with JPA, MVC
    
2. Client-side
    * bootstrap
    * Markdown
    * pagedown - Markdown Editor
    * jQuery

### 사용방법
1. 프로젝트를 다운로드한다.
2. appconfig.xml 파일에서 DB 정보를 수정 후 사용하면 됩니다.
    - 옵션을 조정하면 테이블은 자동으로 생성됨.
    - 기본은 MariaDB로 설정했고, H2 DB는 주석만 풀면 사용할 수 있음.
3. WAS에 배포하고 접속한다. 끝.

### DEMO
데모 사이트를 확인할 수 있습니다.

<http://gilhyeon.xyz:8080/SimpleBlog/>

