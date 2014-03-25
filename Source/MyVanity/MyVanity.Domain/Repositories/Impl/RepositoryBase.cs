using System;
using System.Text;
using MyVanity.Common.Autofac;

namespace MyVanity.Domain.Repositories
{
    public abstract class RepositoryBase : IDisposable
    {
        [Inject]
        public ModelContainer Context { get; set; }

        public void Dispose()
        {
            Context.Dispose();
        }
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
                Dispose();
        }
    }
}
