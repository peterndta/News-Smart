using reciWebApp.Data.Models;

namespace reciWebApp.Data.IRepositories
{
    public interface IStepRepository
    {
        Task<Step> GetStepByIdAsync(int id);
        Task<Step> GetStepByPostIdAsync(string id);
        void CreateStep(Step step);
        Step GetStepById(int id);
        void UpdateStep(Step step);
    }
}
