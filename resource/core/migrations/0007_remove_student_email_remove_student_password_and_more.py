# Generated by Django 4.0.5 on 2022-06-05 08:32

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_student_password'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='student',
            name='email',
        ),
        migrations.RemoveField(
            model_name='student',
            name='password',
        ),
        migrations.RemoveField(
            model_name='student',
            name='username',
        ),
    ]
