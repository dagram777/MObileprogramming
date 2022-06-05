# Generated by Django 4.0.5 on 2022-06-04 15:34

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_remove_student_email_remove_student_username'),
        ('materialResource', '0018_remove_course_users_remove_feedback_users'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='student',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='core.student'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='feedback',
            name='student',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='core.student'),
            preserve_default=False,
        ),
    ]