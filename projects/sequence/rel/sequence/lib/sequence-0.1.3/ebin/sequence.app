{application,sequence,
             [{applications,[kernel,stdlib,elixir,exrm]},
              {description,"sequence"},
              {modules,['Elixir.Sequence','Elixir.Sequence.Server',
                        'Elixir.Sequence.Server.State',
                        'Elixir.Sequence.Stash',
                        'Elixir.Sequence.SubSupervisor',
                        'Elixir.Sequence.Supervisor']},
              {vsn,"0.1.3"},
              {mod,{'Elixir.Sequence',[]}},
              {env,[{initial_number,456},{initial_delta,1}]},
              {registered,['Elixir.Sequence.Server']}]}.