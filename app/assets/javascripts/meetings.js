/**
 * meetings.js
 *
 * Javascript code for handling meetings and shit.
 */
class AttendanceManager {
	constructor() {

	}

	/** Sets whether or not the mason provided attended the evening provided. */
	setAttendance(masonId, meetingId, isAttending) {
		$.post('/meetings/' + meetingId, { mason: masonId, attending: isAttending}, (data) => {
			if (!data.success) {
				console.log('[ERROR] ' + data.message)
			}
		})
	}

	/** Filters bretheren according to the query provided. */
	findBretheren(query) {
		$('.show-meeting-brother').each((i, tr) => {
			let name = $($(tr).find('td')[0]).text().toLowerCase();
			name.includes(query) ? $(tr).removeClass('brother-filtered') : $(tr).addClass('brother-filtered');
		});
	}

	/** Shows the full table again. */
	showFullTable() {
		$('.brother-filtered').removeClass('brother-filtered');
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

	$('#show-meeting-search').on('input', (e) => {
		let searchText = e.target.value;

		if (searchText === '') {
			manager.showFullTable();
		} else {
			manager.findBretheren(searchText.toLowerCase());
		}
	})
});