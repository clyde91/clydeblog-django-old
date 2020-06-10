from django.http import HttpResponse
from django.shortcuts import render,get_object_or_404, redirect
from django.contrib import auth
from django.urls import reverse    # 反向解析


def index(request):
    apps = ["blog","architecture"]
    context = {}
    context['apps'] = apps
    return render(request, "index.html", context)

def about(request):
    context = {}
    return render(request, "about.html", context)

def test(request):
    context = {}
    return render(request, "test.html", context)

def login(request):
    username = request.POST['username']     # POST大写
    password = request.POST['password']
    user = auth.authenticate(request, username=username,password=password)
    referer = request.META.get('HTTP_REFERER', reverse('home'))    # 获得跳转前的网站。如果没有则后者  referer“反向解析”home在的地址
    if user is not None:
        auth.login(request, user)
        return redirect(referer)
    else:
        return render(request, 'error.html', {"message":'用户名或密码不正确'})

