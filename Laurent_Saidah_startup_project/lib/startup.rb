require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup2)
        self.funding > startup2.funding
    end
   
    def hire(employee_name, title)
        if self.valid_title?(title)
           new_employee = Employee.new(employee_name, title)
           @employees << new_employee
        else
            raise "That is not a valid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "We don't have enough money!"
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        total = 0
        @employees.each { |employee| total += @salaries[employee.title] }
        return total/@employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup2)
        @funding += startup2.funding
        startup2.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        startup2.employees.each {|empl| @employees << empl}
        startup2.close
    end
    
end
