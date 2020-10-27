from django.contrib import admin
from .models import Readnum, WebSEO
# Register your models here.


@admin.register(Readnum)
class ReadnumAdmin(admin.ModelAdmin):
    list_display = ("id", "read_num", "content_type", "object_id", "content_object")
    ordering = ("id",)


@admin.register(WebSEO)
class WebSEOAdmin(admin.ModelAdmin):
    # list_display = ("id", "read_num", "content_type", "object_id", "content_object")
    ordering = ("id",)