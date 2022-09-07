from consumer_tasks import say_hello

say_hello.delay("Valon")

print('Producer sent task to queue')