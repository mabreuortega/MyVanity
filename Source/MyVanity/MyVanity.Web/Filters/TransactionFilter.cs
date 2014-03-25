using System.Web.Mvc;
using MyVanity.Common.Autofac;
using MyVanity.Domain;
using MyVanity.Services.Transactions;

namespace MyVanity.Web.Filters
{
    class TransactionFilter : IActionFilter, IPerRequestDependency
    {
        private readonly ModelContainer _context;

        public TransactionFilter(ModelContainer context)
        {
            _context = context;
        }

        public void OnActionExecuting(ActionExecutingContext filterContext)
        {
        }

        public void OnActionExecuted(ActionExecutedContext filterContext)
        {
            var transactionService = DependencyResolver.Current.GetService<ITransactionService>();

            if (transactionService.State.HasFlag(TransactionState.Commit))
                _context.SaveChangesAsync();
        }
    }
}