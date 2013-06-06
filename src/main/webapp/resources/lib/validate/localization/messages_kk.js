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
 * Locale: KK (Kazakh; қазақ тілі)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "Бұл өрісті міндетті түрде толтырыңыз.",
		remote: "Дұрыс мағына енгізуіңізді сұраймыз.",
		email: "Нақты электронды поштаңызды енгізуіңізді сұраймыз.",
		url: "Нақты URL-ды енгізуіңізді сұраймыз.",
		date: "Нақты URL-ды енгізуіңізді сұраймыз.",
		dateISO: "Нақты ISO форматымен сәйкес датасын енгізуіңізді сұраймыз.",
		number: "Күнді енгізуіңізді сұраймыз.",
		digits: "Тек қана сандарды енгізуіңізді сұраймыз.",
		creditcard: "Несие картасының нөмірін дұрыс енгізуіңізді сұраймыз.",
		equalTo: "Осы мәнді қайта енгізуіңізді сұраймыз.",
		accept: "Файлдың кеңейтуін дұрыс таңдаңыз.",
		maxlength: $.format("Ұзындығы {0} символдан көр болмасын."),
		minlength: $.format("Ұзындығы {0} символдан аз болмасын."),
		rangelength: $.format("Ұзындығы {0}-{1} дейін мән енгізуіңізді сұраймыз."),
		range: $.format("Пожалуйста, введите число от {0} до {1}. - {0} - {1} санын енгізуіңізді сұраймыз."),
		max: $.format("{0} аз немесе тең санын енгізуіңіді сұраймыз."),
		min: $.format("{0} көп немесе тең санын енгізуіңізді сұраймыз.")
	});
}(jQuery));