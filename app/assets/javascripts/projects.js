$(document).ready(function(){
	$('#new_project').on('ajax:success', function(event, data, status, xhr) {
		$('#projects').append(data);
	});

	$('#projects').on('ajax:success', '.delete_project', function(event, data, status, xhr) {
		$(this).closest('.project').remove();
	})
	$('#projects').on('ajax:success', '.delete_task', function(event, data, status, xhr) {
		$(this).closest('.task').remove();
	})
	$('#projects').on('ajax:success', '.new_task', function(event, data, status, xhr) {
		$(this).next().prepend(data);
	});
	$('#projects').on('click','.edit_project_link', function(event) {
		event.preventDefault();
		$(this).closest('.project').find('.edit_project').removeClass('invisible');
	});
	$('#projects').on('ajax:success', '.edit_project', function(){
		var new_title = $(this).find('input[type="text"]').val();
		$(this).closest('.project').find('.project_title').html(new_title);
	});

	$('#projects').on('click','.edit_task_link', function(event) {
		event.preventDefault();
		$(this).closest('.task').find('.edit_task').removeClass('invisible');
	});
	$('#projects').on('ajax:success', '.edit_task', function(){
		var new_title = $(this).find('input[type="text"]').val();
		$(this).closest('.task').find('.task_title').html(new_title);
		$(this).addClass('invisible')
	});

	$('#projects').on('click', '.done', function(){
		$(this).toggleClass('done_task');
		var id = $(this).attr('id');
		$.get('task/'+id+'/toggle');
	});

	$('#projects').on('ajax:success', '.up', function(){
		var element = $(this).closest('.task');
		element.insertBefore(element.prev());
	});

	$('#projects').on('ajax:success', '.down', function(){
		var element = $(this).closest('.task');
		element.insertAfter(element.next());
	});
});
