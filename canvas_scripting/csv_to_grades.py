from canvasapi import Canvas

def update_grades(grades, course, assignment_id, id_col, grade_col, feedback_col, skip_if = lambda x: False):
    
    '''
    Updates grades from a list of dicts.
    args:
        grades (list): Contains grades.
            [{
                {id_col}: id (int),
                {grade_col}: grade (int),
                {feedback_col}: feedback (text)
            },]
        course (canvasapi.course.Course): canvas course object
        assignment_id (int): id of canvas assignment
        id_col, grade_col, feedback_col (str): key in grades containing student 
            id, grade, and feedback, respectively
        skip_if (function): function applied to each row in grades. If returns true, that 
            row will be skipped.
    '''

    assignment = course.get_assignment(assignment_id)

    for row in grades:
        if not skip_if(row):
            print(f'Pushing grade for user {row[id_col]}')
            submission = assignment.get_submission(row[id_col])
            submission.edit(
                submission = {'posted_grade': row[grade_col]},
                comment = {'text_comment': row[comment_col]}
            )

if __name__ == '__main__':

    import secrets

    grades = pd.read_csv('grades - 2020-09-22T2019_Grades-10718(1).csv')
    grades = grades.assign(feedback_formatted = lambda x: 'Find detailed feedback here: ' + x['Feedback sheet'] )
    grades = grades.to_dict('records')

    canvas = Canvas('https://canvas.cmu.edu', params.API_KEY)

    course = canvas.get_course(18465)
    assignment_id = 268647

    id_col = 'ID'
    grade_col = 'Grade'
    comment_col = 'feedback_formatted'

    skip_func = lambda x: True if not x.get('Grade') else False

    update_grades(
        grades,
        course,
        assignment_id,
        id_col,
        grade_col,
        comment_col,
        skip_func
    )