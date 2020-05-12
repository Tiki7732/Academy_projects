class Bootcamp
  
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @students = []
        @teachers = []
        @grades = Hash.new { |hash, key| hash[key] = []}
    end

    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teach_name)
        @teachers << teach_name
    end

    def enroll(student_name)
        if @students.length < @student_capacity
            @students << student_name
            return true
        end
        return false
    end

    def enrolled?(student_name)
        if @students.include?(student_name)
            return true
        end
        return false
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student_name, grade)
        if enrolled?(student_name)
            @grades[student_name] << grade
            return true
        end
        return false
    end

    def num_grades(student_name)
        @grades[student_name].length
    end

    def average_grade(student_name)
        if !enrolled?(student_name) || num_grades(student_name) == 0
            return nil
        else
            @grades[student_name].sum / num_grades(student_name)
        end
    end
end
