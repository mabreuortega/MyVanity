using MyVanity.Common.Autofac;

namespace MyVanity.Services.Transactions
{
    public interface ITransactionService : IPerRequestDependency
    {
        TransactionState State { get; }

        void Rollback();
        void Commit();
    }
}
