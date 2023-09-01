FROM openjdk:8
ADD /home/ubuntu/jenkins/workspace/multi-branch_main/jarstaging/com/valaxy/demo-workshop/2.1.2/demo-workshop-2.1.2.jar ttrend.jar
ENTRYPOINT ["java","-jar","ttrend.jar"]