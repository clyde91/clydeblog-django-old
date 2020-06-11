from django import  forms


class LoginForm(forms.Form):
    username = forms.CharField('用户名')
    password = forms.PasswordInput('密码')





