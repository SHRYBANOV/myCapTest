this.before('READ', Employee, async(req) => {});
this.on('READ', Employee, async(req, next) => { return next()});
this.after('READ', Employee, async(employee, req) => {});