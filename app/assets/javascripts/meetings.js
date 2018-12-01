/**
 * meetings.js
 *
 * Javascript code for handling meetings and shit.
 */
class AttendanceManager {
	constructor() {

	}

	setAttendance(masonId, meetingId, isAttending) {
		$.post('/meetings/' + meetingId, { mason: masonId, attending: isAttending}, (data) => {
			if (!data.success) {
				console.log('ERROR! ' + data.message)
			}
		})
	}
}

$(document).ready(() => {
	let manager = new AttendanceManager();

	$('.attended-checkbox').change((e) => {
		let element = $(e.target);

		let masonId = element.data('mason-id');
		let meetingId = element.data('meeting-id');
		let isAttending = e.target.checked;

		manager.setAttendance(masonId, meetingId, isAttending);
	});
});