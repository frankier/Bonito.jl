using JSServe
using Observables
using Hyperscript
JSServe.browser_display()

app = App() do session::Session
    editor = CodeEditor("julia"; initial_source="""1 + 1""")
    eval_button = Button("eval")
    output = Observable(DOM.div())
    on(eval_button) do click
        src = editor.onchange[]
        result = eval(JSServe.parseall(src))
        output[] = DOM.div(result)
    end
    return DOM.div(editor, eval_button, output)
end
