# Generated by Django 4.2.2 on 2023-07-12 07:14

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('booking', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='booking',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='bookingtenant',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='calendar',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='discount',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='flat',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='flatdiscount',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='flatsource',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='landlord',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='source',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='status',
            options={'managed': True},
        ),
        migrations.AlterModelOptions(
            name='tenant',
            options={'managed': True},
        ),
    ]
