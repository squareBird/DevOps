# Start with a base image containing Java runtime
FROM java:11

# Add Author info
LABEL maintainer="fails9503@gmail.com"

# Add a volume to /tmp
# VOLUME 컨테이너의 /tmp 경로를 도커 런타임이 실행중인  Host os의 /var/lib/docker/volume/{hash값}에 마운트
# 컨테이너가 삭제되어도 파일을 유지하기 위함
VOLUME /tmp

# Make port 8080 available to the world outside this container
# 외부로 노출할 포트
EXPOSE 8080

# The application's jar file
# build.gradle에서 build파일 생성경로 변경해서 위치 변경 가능
# ARG 도커파일 안에서만 사용 가능한 환경변수
# ENV Dockerfile과 컨테이너 안에서 사용이 가능한 환경변수
ARG JAR_FILE=build/libs/spring-mvc-0.0.1-SNAPSHOT.jar

# Add the application's jar to the container
# 위의 JAR_FILE을 to-do-springboot.jar라는 이름으로 컨테이너 안의 경로로 복사
# 경로를 별도 지정 안했으므로 /to-do-springboot.jar로 가는 것 같다..
ADD ${JAR_FILE} to-do-springboot.jar

# Run the jar file
# 컨테이너 내부에서 java명령어를 통해 to-do-spring 수행...
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/to-do-springboot.jar"]