import time
from locust import HttpUser, task, between

class QuickstartUser(HttpUser):
    wait_time = between(0.1,10)

    #@task
    #def hello_world(self):
    #    self.client.get("/hello")
    #    self.client.get("/world")

    @task(1)
    def test_root(self):
        self.client.get("")

    @task(3)
    def test_prediction(self):
        self.client.post("predict", json={
               "CHAS":{
                  "0":0
               },
               "RM":{
                  "0":6.575
               },
               "TAX":{
                  "0":296.0
               },
               "PTRATIO":{
                  "0":15.3
               },
               "B":{
                  "0":396.9
               },
               "LSTAT":{
                  "0":4.98
               }
            }
         )