'use strict';

document.addEventListener('DOMContentLoaded', function ()
{
	const email = document.getElementById('text-conversion').firstChild;

	email.nodeValue = email.nodeValue
		.replace(' ', 'chris')
		.replace(' ', '@')
		.replaceAll(' ', '')
		.replaceAll(new RegExp('[yz]', 'g'), '')
		.replace('example', 'rajapet')
		.replace('com', '.net');
});