from django import forms
from django.forms import ModelForm
from .models import Flat, Booking, Tenant, Discount, Source, Landlord, Calendar


class FlatForm(ModelForm):
    class Meta:
        model = Flat
        fields = "__all__"
        exclude = ['source', 'discount']

class DiscountForm(ModelForm):
    class Meta:
        model = Discount
        fields = "__all__"

class SourceForm(ModelForm):
    class Meta:
        model = Source
        fields = "__all__"

class BookingForm(ModelForm):
    class Meta:
        model = Booking
        fields = "__all__"
        exclude = ['tenant', ]

class TenantForm(ModelForm):
    class Meta:
        model = Tenant
        fields = "__all__"
        exclude = ['booking', ]

class CheckDataForm(forms.Form):
    start_date = forms.DateField()
    end_date = forms.DateField()
    total_price = forms.CharField(required=False)
    price = forms.CharField(required=False)
    discount = forms.CharField(required=False)
    nights_amount = forms.CharField(required=False)

class LandlordForm(ModelForm):
    class Meta:
        model = Landlord
        fields = "__all__"

class CalendarForm(ModelForm):
    class Meta:
        model = Calendar
        fields = "__all__"
