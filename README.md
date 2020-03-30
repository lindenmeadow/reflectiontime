# reflectiontime
This is a Sinatra CRUD app that I created as part of my studies in Flatiron School's web developer program. 

MIT Lincense: https://github.com/lindenmeadow/reflectiontime/blob/master/LICENSE

ReflectionTime
**************
Purpose of app: To allow students to create, read, update, and delete reflections/feedback on their school projects. (Teachers likewise can signup and view their students’ reflections or even create reflections of their own, e.g., discussing how they feel their class as a whole did on a project.)

INTERFACE
User can:
	view and complete a reflection form
	submit a reflection form
	edit a reflection form
	delete a reflection form

Model classes:
	User
	Reflection

User class:
	attributes => name, password
	user signs up/logs in
	has secure password
	validates presence and uniqueness of username
	has many reflections

User controller and views:
	‘/signup’ => render signup form
	‘/signup’ => process signup form, create user, post
	‘/login’ => render login form
	‘/login’ => process login form, post
	‘/users/:id/edit => render login form
	‘/patch/:id’ => update username and password
	set sessions
	‘/users/:id’ => user can view their own reflections 

Reflection class:
	attributes => student’s name, teacher’s name, block (section/group student is in), project name, project type, student assessment of their (or their project partners’) conduct, leadership, meeting requirements, creativity, collaboration, critical thinking, communication, and (optional) comments
	belongs to user

Reflection controller and views:
	‘/reflections’ => renders a list of all student reflections
	‘/reflections’ => submits new reflection, post
	‘reflections/new’ => renders new reflection form
	‘reflections/:id’ => renders one instance
	‘reflections/:id/edit’ => renders update form for an instance
	‘reflections/:id’ => updates instance, patch
	‘reflections/:id’ => deletes instance, delete

