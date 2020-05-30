from django.http import HttpResponse
from django.shortcuts import render,get_object_or_404


def index(request):
    apps = ["blog","architecture"]
    context = {}
    context['apps'] = apps
    return render(request, "index.html", context)


def test(request):
    context = {}
    return render(request, "test.html", context)
