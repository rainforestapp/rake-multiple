namespace "multiple" do
  rule "" do |t|
    full_name = t.name

    # Strip of 'multiple:'
    to_invoke = full_name.split(":")[1..-1].join(":")

    require 'parallel'
    worker_count = Integer(ENV.fetch("MULTIPLE_WORKER_COUNT", 1))

    puts "rake-multiple is starting #{worker_count} worker#{worker_count == 1 ? '' : 's'}"

    Parallel.each(1..worker_count) do |worker|
      puts "Starting #{to_invoke} in process #{Process.pid} (#{worker}/#{worker_count})"
      if task = ENV["MULTIPLE_EXECUTE_TASK"]
        puts "Loading #{task}"
        Rake::Task[task].execute
      end
      puts "Invoking #{to_invoke}"
      Rake::Task[to_invoke].execute
      puts "Done invoking #{to_invoke}"
    end
  end
end

