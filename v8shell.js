/*
 * Call jslint from v8 shell and output errors to stdout
 */

var outputErrors = function (errors) {
    var e, i, output = [];
    // debug("Handling " + errors.length + "errors" + '\n');
    function write(s) {
        output.push(s + '\n');
    }
    /* This formatting is copied from JSLint's rhino.js, to be compatible with
       the command-line invocation. */
    for (i = 0; i < errors.length; i += 1) {
        e = errors[i];
        if (e) {
            write('Lint at line ' + e.line + ' character ' +
                        e.character + ': ' + e.reason);
            write((e.evidence || '').
                        replace(/^\s*(\S*(\s+\S+)*)\s*$/, "$1"));
            write('');
        }
    }
    return output.join('');
};

if (!JSLINT(read(input_filename), {})) {
    print(outputErrors(JSLINT.errors));
}
