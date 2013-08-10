$(function() {

	var projects = $('#projects');

	var add_datepicker = function(){
		$(this).datepicker({dateFormat:"yy-mm-dd" });
	};

	var trigger_edit_task_submit = function() {
		//all tasks validation goes here
		$(this).closest('.edit_task').trigger('submit');
	};

	var delete_project = function(event, data, status, xhr) {
		$(this).closest('.project').remove();
	}

	var edit_project = function(event) {
		event.preventDefault();
		$(this).closest('.project').find('input[type="text"]').first().toggleClass('invisible').focus().next().toggleClass('invisible');
	};

	var update_project = function(){
		var new_title = $(this).find('input[type="text"]').val();
		$(this).find('input[type="text"]').addClass('invisible').next().removeClass('invisible').html(new_title);
	};

	var delete_task = function(event, data, status, xhr) {
		$(this).closest('.task').remove();
	};

	var add_new_task = function(event, data, status, xhr) {
		var new_task_form = $(this);
		new_task_form.next().prepend(data);
		new_task_form.find('input[type="text"]').val("").blur();
		new_task_form.find('input[type="submit"]').blur();
	};

	var edit_task = function(event) {
		event.preventDefault();
		$(this).closest('.task').find('input[type="text"]').first().toggleClass('invisible').focus().next().toggleClass('invisible');
	};

	var update_task = function(){
		var update_task_form = $(this);
		var new_title = update_task_form.find('input[type="text"]').first().val();
		update_task_form.find('input[type="text"]').first().addClass('invisible').next().removeClass('invisible').html(new_title);
	};

	var toggle_done_checkbox = function(){
		$(this).toggleClass('done_task');
		var id = $(this).attr('id');
		$.get('task/'+id+'/toggle');
	};

	var move_higher = function(){
		var task = $(this).closest('.task');
		task.insertBefore(task.prev());
	};

	var move_lower = function(){
		var task = $(this).closest('.task');
		task.insertAfter(task.next());
	};

	$('#new_project').on('ajax:success', function(event, data, status, xhr) {
		var new_project_form = $(this);
		projects.append(data);
		new_project_form.find('input[type="text"]').val("").blur();
		new_project_form.find('input[type="submit"]').blur();
	});

	projects.on('ajax:success', '.delete_project', delete_project)
			.on('click','.edit_project_link', edit_project)
			.on('ajax:success', '.edit_project', update_project)
			.on('ajax:success', '.delete_task', delete_task)
			.on('ajax:success', '.new_task', add_new_task)
			.on('click','.edit_task_link', edit_task)
			.on('ajax:success', '.edit_task', update_task)
			.on('click', '.done', toggle_done_checkbox)
			.on('ajax:success', '.up', move_higher)
			.on('ajax:success', '.down', move_lower)
			.on('focus', '.deadline', add_datepicker)
			.on('change', '.deadline', trigger_edit_task_submit)
			.on('change', '.task_title_input', trigger_edit_task_submit);
});
