using System;
using DAL;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class CalculationManager
    {
        public int SumOfProject()
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.SumOfProject();
        }
        public int SumOfCurrentMoney()
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.SumOfCurrentMoney();
        }
        public int SumOfSupportProjects()
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.SumOfSupportProjects();
        }

        public int LikeCountAddition(int ProjectId)
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.LikeCountAddition(ProjectId);
        }
        public int LikeCountSubtraction(int ProjectId)
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.LikeCountSubtraction(ProjectId);
        }
        public int CurrentMoneyAddition(int ProjectId, decimal Money)
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.CurrentMoneyAddition(ProjectId,Money);
        }
        public int CountSupportPeopleMax(int ProjectId)
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.CountSupportPeopleMax(ProjectId);
        }
        public int CountSupportPeopleSmall(int ProjectId)
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.CountSupportPeopleSmall(ProjectId);
        }
        public int CountSupportPeopleMiddle(int ProjectId)
        {
            CalculationService calculationService = new CalculationService();
            return calculationService.CountSupportPeopleMiddle(ProjectId);
        }
    }
}
