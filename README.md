# README

Hi everyone!  
This is a project originally made by Roberto Falconi and Salvatore Licitra for the course "Software Architecture and Cybersecurity" and its teachers Massimo Mecella and Leonardo Querzoni, based at Sapienza - University of Rome.

The code is written in Ruby (v2.4.x) on Rails (v5.x).

This project goal is to let everyone to encrypt or to decrypt messages in order to make a real privacy-oriented system.

### How to run server  
Open a terminal anywhere on your device, then:  
`git clone https://github.com/RobertoFalconi95/Kalypso`  
`cd Kalypso`  
`rails db:migrate`  
`rails db:seed`  
`rails s`  

### How to run tests  

`git clone https://github.com/RobertoFalconi95/Kalypso`   
`cd Kalypso`  
`rails db:migrate`  
`rails db:seed`  
`bundle exec cucumber`  
`bundle exec rspec`  
