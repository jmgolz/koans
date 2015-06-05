require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutExceptions < Neo::Koan

  class MySpecialError < RuntimeError
    def initialize(string='')
      
    end
  end

  def test_exceptions_inherit_from_Exception
    @get_exception_ancestors = nil
    begin
      raise MySpecialError
    rescue MySpecialError => e
      @get_exception_ancestors = MySpecialError.ancestors
    end

    assert_equal @get_exception_ancestors[1], MySpecialError.ancestors[1]
    assert_equal @get_exception_ancestors[2], MySpecialError.ancestors[2]
    assert_equal @get_exception_ancestors[3], MySpecialError.ancestors[3]
    assert_equal @get_exception_ancestors[4], MySpecialError.ancestors[4]
  end

  def test_rescue_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError => ex
      result = ex
    end

    assert_equal ex, result

    assert_equal true, ex.is_a?(StandardError), "Should be a Standard Error"
    assert_equal result.is_a?(RuntimeError), ex.is_a?(RuntimeError),  "Should be a Runtime Error"

    assert RuntimeError.ancestors.include?(StandardError),
      "RuntimeError is a subclass of StandardError"

    assert_equal result.message, ex.message
  end

  def test_raising_a_particular_error
    result = nil
    begin
      # 'raise' and 'fail' are synonyms
      raise MySpecialError, "My Message"
    rescue MySpecialError => ex
      result = ex
    end
    assert_equal ex, result
    assert_equal result.message, ex.message
  end

  def test_ensure_clause
    result = nil
    begin
      fail "Oops"
    rescue StandardError
      # no code here
    ensure
      result = :always_run
    end

    assert_equal __, result
  end

  # Sometimes, we must know about the unknown
  def test_asserting_an_error_is_raised
    # A do-end is a block, a topic to explore more later
    assert_raise(___) do
      raise MySpecialError.new("New instances can be raised directly.")
    end
  end

end
