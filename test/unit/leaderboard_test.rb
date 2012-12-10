require File.dirname(__FILE__) + '/../test_helper'

class LeaderboardTest < ActiveSupport::TestCase
 fixtures :response_maps, :participants, :score_caches, :assignments
 def setup

 end

 def test_score_cache
   sc = ScoreCache.new
   assert sc.save
 end

 def test_score
   sc = score_caches(:sc0).score
   assert  sc <= 100
 end

  def test_get_assessments_for
    @participant = participants(:par14)
    responses = FeedbackResponseMap.get_assessments_for(@participant)
    assert_equal responses,@participant.get_feedback
  end

  def test_getIndependantAssignments
    participant = participants(:par14)
    assignment =  Assignment.find(participant.parent_id)
    assert_not_nil assignment
  end

 def test_getAssignmentsInCourses
   assignment = Assignment.find_all_by_course_id(0)
   assert assignment.blank?
 end

 def test_getParticipantEntriesInAssignment
   assignment = Assignment.find_by_instructor_id(989091321312321312312312313123131313123)
   assert_nil assignment
 end

def test_delete_not_force
		participant = participants(:par1)
		participant.delete
		assert participant.valid?
end

end