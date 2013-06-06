/*******************************************************************************
 * Copyright (C) 2013 ZVIDIA Co., Ltd.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.
 *
 * Contributors:
 *     ZVIDIA Corporation - initial API and implementation
 *******************************************************************************/
/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: AR (Arabic; العربية)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "هذا الحقل إلزامي",
		remote: "يرجى تصحيح هذا الحقل للمتابعة",
		email: "رجاء إدخال عنوان بريد إلكتروني صحيح",
		url: "رجاء إدخال عنوان موقع إلكتروني صحيح",
		date: "رجاء إدخال تاريخ صحيح",
		dateISO: "رجاء إدخال تاريخ صحيح (ISO)",
		number: "رجاء إدخال عدد بطريقة صحيحة",
		digits: "رجاء إدخال أرقام فقط",
		creditcard: "رجاء إدخال رقم بطاقة ائتمان صحيح",
		equalTo: "رجاء إدخال نفس القيمة",
		accept: "رجاء إدخال ملف بامتداد موافق عليه",
		maxlength: $.validator.format("الحد الأقصى لعدد الحروف هو {0}"),
		minlength: $.validator.format("الحد الأدنى لعدد الحروف هو {0}"),
		rangelength: $.validator.format("عدد الحروف يجب أن يكون بين {0} و {1}"),
		range: $.validator.format("رجاء إدخال عدد قيمته بين {0} و {1}"),
		max: $.validator.format("رجاء إدخال عدد أقل من أو يساوي (0}"),
		min: $.validator.format("رجاء إدخال عدد أكبر من أو يساوي (0}")
	});
}(jQuery));